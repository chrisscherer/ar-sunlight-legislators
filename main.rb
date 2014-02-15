require_relative 'app/models/senator.rb'

def get_state_reps(state)
  puts "\n Senators: "
  puts Senator.where(state: state, title: "Sen").order(:lastname)
  puts "\n Representatives: "
  puts Senator.where(state: state, title: "Rep").order(:lastname)
end

def calc_gender_distribution(gender)
  sen_count = Senator.where(gender: gender, title: "Sen", in_office: "1").count
  rep_count = Senator.where(gender: gender, title: "Rep", in_office: "1").count
  rep_percent = (rep_count / 435.00 * 100).round 
  p "#{gender} Senators: #{sen_count} (#{sen_count}%)"
  p "#{gender} Representatives: #{rep_count} (#{rep_percent}%)"
end

def print_state_info
  hold_states =[]
  Senator.all.map{|sen|
    hold_states << sen.state
  }
  p hold_states.uniq!.sort.count
    # sen_count = Senator.where(gender: gender,state: state, title: "Sen", in_office: "1").count
    # rep_count = Senator.where(gender: gender,state: state, title: "Rep", in_office: "1").count
     
end

# get_state_reps('AL')
# calc_gender_distribution("F")
print_state_info
