Trestle.resource(:bookings) do
  remove_action :new
  remove_action :edit
  remove_action :show

  menu do
    group :content, priority: :first do
      item :bookings, icon: "fas fa-building", unless: -> { current_user.superadmin? }
    end
  end

  table do
    column :service do |booking|
      booking.service.name
    end
    column :booking_date
    column :total_price, align: :right, format: :currency
    actions
  end
end
