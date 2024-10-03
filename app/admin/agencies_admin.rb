Trestle.resource(:agencies, model: Agency) do
  menu do
    group :content, priority: :first do
      item :agencies, icon: "fas fa-building", if: -> { current_user.superadmin? }
    end
  end

  table do
    column :name, link: true
    column :address
    column :phone_number
    column :image do |agency|
      if agency.image.present?
        image_tag agency.image.url, style: "max-height: 50px; max-width: 50px;"
      end
    end
    actions
  end

  form do |agency|
    text_field :name
    text_area :address
    text_field :phone_number
    file_field :image
  end
end
