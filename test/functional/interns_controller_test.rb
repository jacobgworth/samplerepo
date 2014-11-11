require 'test_helper'

class InternsControllerTest < ActionController::TestCase
  setup do
    @intern = interns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create intern" do
    assert_difference('Intern.count') do
      post :create, intern: { Christian_experience: @intern.Christian_experience, abrasive_trait: @intern.abrasive_trait, accepted_Christ: @intern.accepted_Christ, adaptive_trait: @intern.adaptive_trait, address: @intern.address, age: @intern.age, attend_church: @intern.attend_church, best_call_time: @intern.best_call_time, birthday: @intern.birthday, camp_experience: @intern.camp_experience, can_text: @intern.can_text, ce_city: @intern.ce_city, ce_hired: @intern.ce_hired, ce_phone: @intern.ce_phone, ce_position: @intern.ce_position, ce_state: @intern.ce_state, cell_phone: @intern.cell_phone, certifications: @intern.certifications, child_experience: @intern.child_experience, church_city: @intern.church_city, church_member: @intern.church_member, church_phone: @intern.church_phone, church_state: @intern.church_state, city: @intern.city, college: @intern.college, college_city: @intern.college_city, college_dates_attended: @intern.college_dates_attended, college_graduated: @intern.college_graduated, college_state: @intern.college_state, compassionate_trait: @intern.compassionate_trait, considerate_trait: @intern.considerate_trait, cpr_cert: @intern.cpr_cert, current_employer: @intern.current_employer, currently_employed: @intern.currently_employed, denomination: @intern.denomination, describe_the_Gospel: @intern.describe_the_Gospel, detail_oriented_trait: @intern.detail_oriented_trait, determined_trait: @intern.determined_trait, drugs: @intern.drugs, education_other: @intern.education_other, email: @intern.email, emergency_1: @intern.emergency_1, emergency_1_phone: @intern.emergency_1_phone, emergency_1_relationship: @intern.emergency_1_relationship, emergency_2_name: @intern.emergency_2_name, emergency_2_phone: @intern.emergency_2_phone, emergency_2_relationship: @intern.emergency_2_relationship, ever_arrested: @intern.ever_arrested, ever_children: @intern.ever_children, ever_criminal_convicted: @intern.ever_criminal_convicted, ever_explainers: @intern.ever_explainers, ever_married: @intern.ever_married, father_accepted_Christ: @intern.father_accepted_Christ, father_address: @intern.father_address, father_city: @intern.father_city, father_consent: @intern.father_consent, father_denomination: @intern.father_denomination, father_name: @intern.father_name, father_occupation: @intern.father_occupation, father_phone: @intern.father_phone, father_state: @intern.father_state, father_work_phone: @intern.father_work_phone, firstaid_cert: @intern.firstaid_cert, firstname: @intern.firstname, foreign_language: @intern.foreign_language, friendly_trait: @intern.friendly_trait, future_plans: @intern.future_plans, gender: @intern.gender, genuine_trait: @intern.genuine_trait, hard_working_trait: @intern.hard_working_trait, health_description: @intern.health_description, health_insurance: @intern.health_insurance, highest_education_level: @intern.highest_education_level, home_church: @intern.home_church, home_phone: @intern.home_phone, homeless_experience: @intern.homeless_experience, how_long_attended: @intern.how_long_attended, how_long_married: @intern.how_long_married, hs_attended: @intern.hs_attended, hs_city: @intern.hs_city, hs_class: @intern.hs_class, hs_graduate: @intern.hs_graduate, hs_state: @intern.hs_state, impulsive_trait: @intern.impulsive_trait, influential_experiences: @intern.influential_experiences, insurance_provider: @intern.insurance_provider, internship_type: @intern.internship_type, kind_trait: @intern.kind_trait, language_proficiency: @intern.language_proficiency, lastname: @intern.lastname, lazy_trait: @intern.lazy_trait, leader_trait: @intern.leader_trait, lighting_experience: @intern.lighting_experience, loving_trait: @intern.loving_trait, major: @intern.major, marital_status: @intern.marital_status, mature_trait: @intern.mature_trait, medications: @intern.medications, ministry_training: @intern.ministry_training, mission_city: @intern.mission_city, mission_experience: @intern.mission_experience, mission_state: @intern.mission_state, modest_trait: @intern.modest_trait, moody_trait: @intern.moody_trait, mother_accepted_Christ: @intern.mother_accepted_Christ, mother_address: @intern.mother_address, mother_city: @intern.mother_city, mother_consent: @intern.mother_consent, mother_denomination: @intern.mother_denomination, mother_name: @intern.mother_name, mother_occupation: @intern.mother_occupation, mother_phone: @intern.mother_phone, mother_state: @intern.mother_state, mother_work_phone: @intern.mother_work_phone, motivated_trait: @intern.motivated_trait, organized_trait: @intern.organized_trait, other_cert: @intern.other_cert, other_child_experience: @intern.other_child_experience, other_schools: @intern.other_schools, parent_feelings: @intern.parent_feelings, past_employer: @intern.past_employer, patient_trait: @intern.patient_trait, pe_city: @intern.pe_city, pe_hired: @intern.pe_hired, pe_phone: @intern.pe_phone, pe_position: @intern.pe_position, pe_state: @intern.pe_state, photography_experience: @intern.photography_experience, physical_limitation: @intern.physical_limitation, punctual_trait: @intern.punctual_trait, quiet: @intern.quiet, ref1_name: @intern.ref1_name, ref1_rel: @intern.ref1_rel, ref2_name: @intern.ref2_name, ref2_rel: @intern.ref2_rel, ref3_name: @intern.ref3_name, ref3_rel: @intern.ref3_rel, ref4_name: @intern.ref4_name, ref4_rel: @intern.ref4_rel, relaxed_trait: @intern.relaxed_trait, sarcastic_trait: @intern.sarcastic_trait, self_motivated_trait: @intern.self_motivated_trait, selfish_trait: @intern.selfish_trait, senior_experience: @intern.senior_experience, senior_pastor: @intern.senior_pastor, sensitive_trait: @intern.sensitive_trait, siblings: @intern.siblings, socially_awkward_trait: @intern.socially_awkward_trait, spouse_name: @intern.spouse_name, state: @intern.state, tactful_trait: @intern.tactful_trait, teachable_trait: @intern.teachable_trait, tech_training: @intern.tech_training, termdesired: @intern.termdesired, trustworthy_trait: @intern.trustworthy_trait, tshirt_size: @intern.tshirt_size, vbs_experience: @intern.vbs_experience, water_baptized: @intern.water_baptized, what_languages: @intern.what_languages, why_intern: @intern.why_intern, why_moh_wants: @intern.why_moh_wants, worship_team_experience: @intern.worship_team_experience, youth_pastor: @intern.youth_pastor, zip: @intern.zip }
    end

    assert_redirected_to intern_path(assigns(:intern))
  end

  test "should show intern" do
    get :show, id: @intern
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @intern
    assert_response :success
  end

  test "should update intern" do
    put :update, id: @intern, intern: { Christian_experience: @intern.Christian_experience, abrasive_trait: @intern.abrasive_trait, accepted_Christ: @intern.accepted_Christ, adaptive_trait: @intern.adaptive_trait, address: @intern.address, age: @intern.age, attend_church: @intern.attend_church, best_call_time: @intern.best_call_time, birthday: @intern.birthday, camp_experience: @intern.camp_experience, can_text: @intern.can_text, ce_city: @intern.ce_city, ce_hired: @intern.ce_hired, ce_phone: @intern.ce_phone, ce_position: @intern.ce_position, ce_state: @intern.ce_state, cell_phone: @intern.cell_phone, certifications: @intern.certifications, child_experience: @intern.child_experience, church_city: @intern.church_city, church_member: @intern.church_member, church_phone: @intern.church_phone, church_state: @intern.church_state, city: @intern.city, college: @intern.college, college_city: @intern.college_city, college_dates_attended: @intern.college_dates_attended, college_graduated: @intern.college_graduated, college_state: @intern.college_state, compassionate_trait: @intern.compassionate_trait, considerate_trait: @intern.considerate_trait, cpr_cert: @intern.cpr_cert, current_employer: @intern.current_employer, currently_employed: @intern.currently_employed, denomination: @intern.denomination, describe_the_Gospel: @intern.describe_the_Gospel, detail_oriented_trait: @intern.detail_oriented_trait, determined_trait: @intern.determined_trait, drugs: @intern.drugs, education_other: @intern.education_other, email: @intern.email, emergency_1: @intern.emergency_1, emergency_1_phone: @intern.emergency_1_phone, emergency_1_relationship: @intern.emergency_1_relationship, emergency_2_name: @intern.emergency_2_name, emergency_2_phone: @intern.emergency_2_phone, emergency_2_relationship: @intern.emergency_2_relationship, ever_arrested: @intern.ever_arrested, ever_children: @intern.ever_children, ever_criminal_convicted: @intern.ever_criminal_convicted, ever_explainers: @intern.ever_explainers, ever_married: @intern.ever_married, father_accepted_Christ: @intern.father_accepted_Christ, father_address: @intern.father_address, father_city: @intern.father_city, father_consent: @intern.father_consent, father_denomination: @intern.father_denomination, father_name: @intern.father_name, father_occupation: @intern.father_occupation, father_phone: @intern.father_phone, father_state: @intern.father_state, father_work_phone: @intern.father_work_phone, firstaid_cert: @intern.firstaid_cert, firstname: @intern.firstname, foreign_language: @intern.foreign_language, friendly_trait: @intern.friendly_trait, future_plans: @intern.future_plans, gender: @intern.gender, genuine_trait: @intern.genuine_trait, hard_working_trait: @intern.hard_working_trait, health_description: @intern.health_description, health_insurance: @intern.health_insurance, highest_education_level: @intern.highest_education_level, home_church: @intern.home_church, home_phone: @intern.home_phone, homeless_experience: @intern.homeless_experience, how_long_attended: @intern.how_long_attended, how_long_married: @intern.how_long_married, hs_attended: @intern.hs_attended, hs_city: @intern.hs_city, hs_class: @intern.hs_class, hs_graduate: @intern.hs_graduate, hs_state: @intern.hs_state, impulsive_trait: @intern.impulsive_trait, influential_experiences: @intern.influential_experiences, insurance_provider: @intern.insurance_provider, internship_type: @intern.internship_type, kind_trait: @intern.kind_trait, language_proficiency: @intern.language_proficiency, lastname: @intern.lastname, lazy_trait: @intern.lazy_trait, leader_trait: @intern.leader_trait, lighting_experience: @intern.lighting_experience, loving_trait: @intern.loving_trait, major: @intern.major, marital_status: @intern.marital_status, mature_trait: @intern.mature_trait, medications: @intern.medications, ministry_training: @intern.ministry_training, mission_city: @intern.mission_city, mission_experience: @intern.mission_experience, mission_state: @intern.mission_state, modest_trait: @intern.modest_trait, moody_trait: @intern.moody_trait, mother_accepted_Christ: @intern.mother_accepted_Christ, mother_address: @intern.mother_address, mother_city: @intern.mother_city, mother_consent: @intern.mother_consent, mother_denomination: @intern.mother_denomination, mother_name: @intern.mother_name, mother_occupation: @intern.mother_occupation, mother_phone: @intern.mother_phone, mother_state: @intern.mother_state, mother_work_phone: @intern.mother_work_phone, motivated_trait: @intern.motivated_trait, organized_trait: @intern.organized_trait, other_cert: @intern.other_cert, other_child_experience: @intern.other_child_experience, other_schools: @intern.other_schools, parent_feelings: @intern.parent_feelings, past_employer: @intern.past_employer, patient_trait: @intern.patient_trait, pe_city: @intern.pe_city, pe_hired: @intern.pe_hired, pe_phone: @intern.pe_phone, pe_position: @intern.pe_position, pe_state: @intern.pe_state, photography_experience: @intern.photography_experience, physical_limitation: @intern.physical_limitation, punctual_trait: @intern.punctual_trait, quiet: @intern.quiet, ref1_name: @intern.ref1_name, ref1_rel: @intern.ref1_rel, ref2_name: @intern.ref2_name, ref2_rel: @intern.ref2_rel, ref3_name: @intern.ref3_name, ref3_rel: @intern.ref3_rel, ref4_name: @intern.ref4_name, ref4_rel: @intern.ref4_rel, relaxed_trait: @intern.relaxed_trait, sarcastic_trait: @intern.sarcastic_trait, self_motivated_trait: @intern.self_motivated_trait, selfish_trait: @intern.selfish_trait, senior_experience: @intern.senior_experience, senior_pastor: @intern.senior_pastor, sensitive_trait: @intern.sensitive_trait, siblings: @intern.siblings, socially_awkward_trait: @intern.socially_awkward_trait, spouse_name: @intern.spouse_name, state: @intern.state, tactful_trait: @intern.tactful_trait, teachable_trait: @intern.teachable_trait, tech_training: @intern.tech_training, termdesired: @intern.termdesired, trustworthy_trait: @intern.trustworthy_trait, tshirt_size: @intern.tshirt_size, vbs_experience: @intern.vbs_experience, water_baptized: @intern.water_baptized, what_languages: @intern.what_languages, why_intern: @intern.why_intern, why_moh_wants: @intern.why_moh_wants, worship_team_experience: @intern.worship_team_experience, youth_pastor: @intern.youth_pastor, zip: @intern.zip }
    assert_redirected_to intern_path(assigns(:intern))
  end

  test "should destroy intern" do
    assert_difference('Intern.count', -1) do
      delete :destroy, id: @intern
    end

    assert_redirected_to interns_path
  end
end