require 'test_helper'

class DoctorUnavailabilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor_unavailability = doctor_unavailabilities(:one)
  end

  test "should get index" do
    get doctor_unavailabilities_url
    assert_response :success
  end

  test "should get new" do
    get new_doctor_unavailability_url
    assert_response :success
  end

  test "should create doctor_unavailability" do
    assert_difference('DoctorUnavailability.count') do
      post doctor_unavailabilities_url, params: { doctor_unavailability: {  } }
    end

    assert_redirected_to doctor_unavailability_url(DoctorUnavailability.last)
  end

  test "should show doctor_unavailability" do
    get doctor_unavailability_url(@doctor_unavailability)
    assert_response :success
  end

  test "should get edit" do
    get edit_doctor_unavailability_url(@doctor_unavailability)
    assert_response :success
  end

  test "should update doctor_unavailability" do
    patch doctor_unavailability_url(@doctor_unavailability), params: { doctor_unavailability: {  } }
    assert_redirected_to doctor_unavailability_url(@doctor_unavailability)
  end

  test "should destroy doctor_unavailability" do
    assert_difference('DoctorUnavailability.count', -1) do
      delete doctor_unavailability_url(@doctor_unavailability)
    end

    assert_redirected_to doctor_unavailabilities_url
  end
end
