class Review < Neo4j::Migrations::Base
  def up
    add_constraint :Review, :uuid
  end

  def down
    drop_constraint :Review, :uuid
  end
end
