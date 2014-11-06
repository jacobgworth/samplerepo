class Intern < ActiveRecord::Base

  has_many :assets
  
  accepts_nested_attributes_for :assets, :allow_destroy => true

  attr_accessible :assets_attributes,:father_zip,:mother_zip,:father_last_name,:mother_last_name,:address2,:Christian_experience, :abrasive_trait, :accepted_Christ, :adaptive_trait, :address, :age, :attend_church,:best_call_time,:birthday, :camp_experience, :can_text, :ce_city, :ce_hired, :ce_phone, :ce_position, :ce_state, :cell_phone, :certifications, :child_experience, :church_city, :church_member, :church_phone, :church_state, :city, :college, :college_city, :college_dates_attended, :college_graduated, :college_state, :compassionate_trait, :considerate_trait, :cpr_cert, :current_employer, :currently_employed, :denomination, :describe_the_Gospel, :detail_oriented_trait, :determined_trait, :drugs, :education_other, :email, :emergency_1_name, :emergency_1_phone, :emergency_1_relationship, :emergency_2_name, :emergency_2_phone, :emergency_2_relationship, :ever_arrested, :ever_children, :ever_criminal_convicted, :ever_explainers, :ever_married, :father_accepted_Christ, :father_address, :father_address_2, :father_city, :father_consent, :father_denomination, :father_name, :father_occupation, :father_phone, :father_state, :father_work_phone, :firstaid_cert, :firstname, :foreign_language, :friendly_trait, :future_plans, :gender, :genuine_trait, :hard_working_trait, :health_description, :health_insurance, :highest_education_level, :home_church, :home_phone, :homeless_experience, :how_long_attended, :how_long_married, :hs_attended, :hs_city, :hs_class, :hs_graduate, :hs_state, :impulsive_trait, :influential_experiences, :insurance_provider, :internship_type, :kind_trait, :language_proficiency, :lastname, :lazy_trait, :leader_trait, :lighting_experience, :loving_trait, :major, :marital_status, :mature_trait, :medications, :ministry_training, :mission_city, :mission_experience, :mission_state, :modest_trait, :moody_trait, :mother_accepted_Christ, :mother_address, :mother_address_2, :mother_city, :mother_consent, :mother_denomination, :mother_name, :mother_occupation, :mother_phone, :mother_state, :mother_work_phone, :motivated_trait, :organized_trait, :other_cert, :other_child_experience, :other_schools, :parent_feelings, :past_employer, :patient_trait, :pe_city, :pe_hired, :pe_phone, :pe_position, :pe_state, :photography_experience, :physical_limitation, :punctual_trait, :quiet_trait, :ref1_name,:ref1_last_name,:ref2_last_name,:ref3_last_name,:ref4_last_name, :ref1_rel, :ref2_name, :ref2_rel, :ref3_name, :ref3_rel, :ref4_name, :ref4_rel, :relaxed_trait, :sarcastic_trait, :self_motivated_trait, :selfish_trait, :senior_experience, :senior_pastor, :sensitive_trait, :siblings, :socially_awkward_trait, :spouse_name, :state, :tactful_trait, :teachable_trait, :tech_training, :termdesired, :trustworthy_trait, :tshirt_size, :vbs_experience, :water_baptized, :what_languages, :why_intern, :why_moh_wants, :worship_team_experience, :youth_pastor, :zip



  def self.as_csv
  CSV.generate do |csv|
    csv << column_names
    all.each do |item|
      csv << item.attributes.values_at(*column_names)
    end
  end
end
end
