require 'rails_helper'

RSpec.describe User, type: :model do
  users = [{
              first_name: "John",
              last_name: "Johnson",
              email: "jjohnson@fakeu.edu",
              password: "password"
            },
            {
              first_name: "Mary",
              last_name: "Mumford",
              email: "mmumford@fakeu.edu",
              password: "password"
            },
            {
              last_name: "Prince",
              email: "prince@fakeu.edu",
              password: "password",
            }]
  describe "display_name shows correctly" do
    context "main" do
      before :each do
        User.create(users)
      end
      it "checks that display_name is last name when first name is null" do
        expect(
          User.find_by_email("prince@fakeu.edu").display_name
        ).to eq("Prince")
      end
      it "checks that display name is first + last if not otheriwse set." do
        expect(
          User.find_by_email("mmumford@fakeu.edu").display_name
        ).to eq("Mary Mumford")
      end
    end
  end
end
