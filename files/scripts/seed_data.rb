module Files
  module Scripts
    class SeedData
      def self.execute
        portal_user_params = {
          email: 'duc+001@billfloat',
          first_name: 'Duc',
          last_name: 'Phan',
          legal_name: 'Rubicubes, Inc.'
        }

        p = PortalUser.create(portal_user_params)

        first_user_params = {
          email: 'duc+001@billfloat',
          first_name: 'Duc',
          last_name: 'Phan',
          username: 'phanducsjsu',
          password: '123456',
          is_portal_user: true,
          portal_user_id: p.id
        }

        u1 = User.create(first_user_params)
        Email.create(email_address: 'duc+001@billfloat.com', user_id: u1.id)
        PhoneNumber.create(number: '4085109019', user_id: u1.id)
        Address.create(street: '2630 Bon Bon Dr', city: 'San Jose', state: 'CA', zip: '95148')

        second_user_params = {
          email: 'aathavan+001@billfloat',
          first_name: 'Aathavan',
          last_name: 'Thayabaran',
          username: 'aathavan',
          password: '123456',
          is_portal_user: false,
          portal_user_id: p.id
        }

        u2 = User.create(second_user_params)
        Email.create(email_address: 'aathavan+001@billfloat.com', user_id: u2.id)
        PhoneNumber.create(number: '2222222222', user_id: u2.id)

      end
    end
  end
end
