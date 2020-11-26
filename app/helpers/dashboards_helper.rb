module DashboardsHelper
    def total
        buff = 0
        Order.all.each do |t|
          buff += t.total_price
        end 
        return buff
    end
    def cart_average
        return (total/Order.all.count).round(2)
    end
end
