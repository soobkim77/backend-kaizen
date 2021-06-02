class BoardSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description

  attributes :owner do |obj|
    owner = {
      username: obj.owner.username,
      type: obj.owner_type
    }
    owner
  end

  attributes :statuses do |obj|
  end
end
