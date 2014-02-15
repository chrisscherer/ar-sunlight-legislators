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
  state_count = {}
  Senator.all.map{|sen|
    hold_states << sen.state
  }
  hold_states.uniq!

  hold_states.each do |state|
    state_count[state] = Senator.where(state: state, title: "Rep").count    
  end

  state_count.sort_by{|state, count| count}.reverse.each do |state, count|
    puts "#{state}: 2 Senators, #{count} Representatives"
  end 
end

# get_state_reps('AL')
# calc_gender_distribution("F")
print_state_info
