require 'spec_helper'

describe "schools/index" do
  it 'should render school name and groups name if schools.any?' do
    current_user = create(:user)

    group1 = stub_model(Group, :name => "group-1")
    group2 = stub_model(Group, :name => "group-2")
    group3 = stub_model(Group, :name => "group-3")

    school1 = stub_model(School, :name => "school-1", user_id: current_user.id, groups: [group1])
    school2 = stub_model(School, :name => "school-2", user_id: current_user.id, groups: [group2, group3])

    assign(:schools, [school1, school2])

    render

    expect(rendered).to have_selector('a', :text=> 'school-1')
    expect(rendered).to have_selector('a', :text=> 'school-2')
    expect(rendered).to have_selector('a', :text=> 'group-1')
    expect(rendered).to have_selector('a', :text=> 'group-2')
    expect(rendered).to have_selector('a', :text=> 'group-3')
  end

end
