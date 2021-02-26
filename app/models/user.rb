class User < ApplicationRecord
    has_secure_password
    has_one_attached :photo
    geocoded_by :address
    after_validation :geocode
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users

    def address
        [street, city, state].compact.join(', ')
    end

    def self.find_partners(args) #grabs partner params and finds users based off of params
        climbing_preference = args['climbing_preference'].downcase #couldn't figure a way to destructure, So this is my way of doing it
        skill_level = args['skill_level'].downcase
        gender = args['gender'].downcase
        commitment = args['commitment'].downcase
        distance = args['distance'].downcase
        id = args['id']

        if climbing_preference == 'any'
            climbing_preference = ['lead', 'top rope', 'boulder', 'trad']
        end

        if skill_level == 'any'
            skill_level = ['5.8', '5.9', '5.10', '5.11', '5.12', '5.13']
        end

        if gender == 'any'
            gender = ['male', 'female', 'other']
        end

        if commitment == 'any'
            commitment = 1..7
        end

        if distance == 'any'
            return self.where(climbing_preference: climbing_preference, commitment: commitment, skill_level: skill_level, gender: gender)
        end
        user = self.find(id)
        user.nearbys(distance).where(climbing_preference: climbing_preference, commitment: commitment, skill_level: skill_level, gender: gender)
    end
end
