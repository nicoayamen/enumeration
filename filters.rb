# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id, candidates)
  candidates.find { |candidate| candidate[:id] == id }
end
  
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2  
  end
  
  # Define a method to check if a candidate has 100 or more GitHub points
def enough_github_points?(candidate)
  candidate[:github_points] >= 100
end

# Define a method to check if a candidate knows Ruby or Python
def knows_ruby_or_python?(candidate)
  candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
end

# Define a method to check if a candidate applied in the last 15 days
def applied_recently?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

# Define a method to check if a candidate is over the age of 17
def over_18?(candidate)
  candidate[:age] > 17
end

# Define the main method to find qualified candidates
def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) &&
    enough_github_points?(candidate) &&
    knows_ruby_or_python?(candidate) &&
    applied_recently?(candidate) &&
    over_18?(candidate)
  end
end

def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end