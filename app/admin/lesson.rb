ActiveAdmin.register Lesson do

    menu false

    permit_params do
        permitted = [:subject_matter_id, :name, :order]
        permitted << :is_approved if ['admin', 'superuser', 'courseuser'].include? current_admin_user.role
        permitted
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
                    h3 "Course: #{lesson.subject_matter.course.name}"
                    h3 "Subject Matter: #{lesson.subject_matter.name}"
                    h3 "Lesson Name: #{lesson.name}"
                end
            end
            column max_width: "65%" do
                panel "Translations" do
                    table_for lesson.lesson_translation do
                        column "Language" do |lt|
                            lt.language.name
                        end
                        column "Translation" do |lt|
                            raw(lt.translation)
                        end
                        column "Approved" do |lt|
                            status_tag lt.is_approved
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
                    f.has_many :lesson_translation, new_record: false do |lt|
                        lt.inputs
                    end
                end
            end
        end
        f.actions
    end


end
