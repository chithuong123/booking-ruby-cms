Trestle.resource(:users) do
  remove_action :new

  menu do
    group :content, priority: :first do
      item :users, icon: "fas fa-building", if: -> { current_user.superadmin? }
    end
  end

  table do
    column :email, link: true
    column :username
    actions
  end

  form do |service|
    text_field :username
    text_field :email
    password_field :password
  end
end
