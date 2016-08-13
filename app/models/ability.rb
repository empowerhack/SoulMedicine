class Ability
  include CanCan::Ability

  def initialize(user)
  
      user ||= AdminUser.new # guest user (not logged in)
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      send(user.role)
      
  end
  
  # Simple User
  # Can only edit own profile
  def user
    can :read, ActiveAdmin::Page, :name => "Dashboard"
  end
  
  
  # Translator
  # Can add translations (cannot approve)
  def translator
    user
    can :read, [Course,SubjectMatter,Lesson]
    can [:read,:update], LessonTranslation
  end
  
  
  # Course User
  # Can add courses
  def courseuser
    can :read, ActiveAdmin::Page, :name => "Dashboard"
    can :manage, [Course,SubjectMatter,Lesson,LessonTranslation]
    cannot :manage, AdminUser
  end
  
  
  # Super User
  # Can do everything except add new admin users
  def superuser
    courseuser
    can :read, :all
    can :read, AdminUser
    can :manage, [Country,Language,Gender,MessageService]
  end
  
  
  # Admin User
  # Basically Superman
  def admin
    superuser
    can :manage, :all
  end
  
  
  
end
