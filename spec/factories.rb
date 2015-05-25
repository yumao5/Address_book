FactoryGirl.define do

factory :user2, class: AdminUser do
                    id "1"
                    createby "admin"
                    first_name "maker"
                    last_name "maker"
                    email "maker@hotmail.com"
                    phone "111111111"
                  end

factory :user1, class: AdminUser do
                   createby "admin"
                   first_name "ring"
                   last_name "ring"
                   email "ring@hotmail.com"
                   phone "222222222"
                 end
end
