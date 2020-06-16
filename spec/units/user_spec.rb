require 'user'

describe User do 

    subject = User.new(1, "Tristan", "Langford", "some_email@hotmail.com", "password") 

    it 'will hold the details on creation in instance variables' do 
        expect(subject.user_id).to eq(1)
        expect(subject.first_name).to eq("Tristan")
        expect(subject.last_name).to eq("Langford")
        expect(subject.email).to eq("some_email@hotmail.com")
        expect(subject.password).to eq("password")
    end


end