# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 2, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "px-4 py-16 md:py-32 text-center m-auto max-w-3xl" do
      h2 "Welcome to ActiveAdmin", class: "text-base font-semibold leading-7 text-indigo-600 dark:text-indigo-500"
      para "This is the default page", class: "mt-2 text-3xl sm:text-4xl font-bold text-gray-900 dark:text-gray-200"
      div class: "mt-6 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4" do
        a href: admin_dunks_path, class: "p-4 bg-indigo-500 text-white rounded-lg" do
          span "Dunks", class: "text-lg font-semibold"
        end
        a href: admin_users_path, class: "p-4 bg-blue-500 text-white rounded-lg" do
          span "Users", class: "text-lg font-semibold"
        end
      end
    end
  end
end
