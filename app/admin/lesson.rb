ActiveAdmin.register Lesson do

    menu false

    permit_params do
        permitted = [:subject_matter_id, :name, :order]
        permitted << [lesson_translation_attributes:[:translation, :language_id, :is_approved, :id]]
        permitted << :is_approved if ['admin', 'superuser', 'courseuser'].include? current_admin_user.role
        permitted
    end
    
    controller do
        def scoped_collection
            super.includes :lesson_translation
        end
    end
    
    index do
        selectable_column
        column "Course" do |lesson|
            sub = SubjectMatter.find( lesson.subject_matter_id )
            course = Course.find( sub.course_id )
            link_to course.name, admin_course_path(course.id)
        end
        column :subject_matter_id
        column "Translations" do |lesson|
            link_to "View Translations", admin_lesson_translations_path(q: { lesson_id_eq: lesson.id})
        end
        column :name
        column :is_approved
        actions
    end
    
    remove_filter :lesson_translation

    show do
        columns do
            column max_width: "35%" do
                panel "Lesson" do
                    attributes_table_for lesson do
                        row :name
                        row :description
                        row :order
                        row('Course') { |l| link_to l.subject_matter.course.name, admin_course_path(l.subject_matter.course) }
                        row('Subject Matter') { |l| link_to l.subject_matter.name, admin_subject_matter_path(l.subject_matter) }
                    end
                end
            end
            column max_width: "65%" do
                panel "Translations" do
                    table_for lesson.lesson_translation do
                        column "Language" do |lt|
                            link_to lt.language.name, admin_lesson_translation_path(lt)
                        end
                        column "Translation" do |lt|
                            raw(lt.translation)
                        end
                        column "Approved" do |lt|
                            status_tag lt.is_approved
                        end
                        column do |lt|
                            link_to "Edit", edit_admin_lesson_translation_path(lt)
                        end
                    end
                end
            end
        end
    end
    
    form do |f|
        f.semantic_errors *f.object.errors.keys
        tabs do
            tab "Lesson Details" do
                f.inputs
            end
            if !f.object.new_record?
                tab "Translations" do
                    f.has_many :lesson_translation, heading: false, allow_destroy: false, new_record: false do |lt|
                        lt.input :language, :input_html => { :disabled => true } 
                        lt.input :translation
                        if ['admin', 'superuser', 'courseuser'].include? current_admin_user.role
                            lt.input :is_approved
                        end
                    end
                end
            end
        end
        f.actions
    end


end
