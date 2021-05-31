class TeamSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :id

  attributes :leader do |obj|
    leader = {
      name: obj.leader.username,
      id: obj.leader.id
    }
    leader
  end 

  attributes :members do |obj|
    members = []
    obj.members.each do |m|
      members << m.username
    end
    members
  end

  attributes :boards do |obj|
    boards = []
    obj.boards.each do |b|
      boards << b
    end
    boards
  end

end
