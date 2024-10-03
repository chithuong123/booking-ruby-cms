Trestle.resource(:users) do
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
end
