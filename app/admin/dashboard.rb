ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Current Languages" do
          ul do
            Language.all.each do |lang|
              li link_to(lang.name, admin_language_path(lang))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to Soul Medicine."
        end
      end
    end
  end # content
end
