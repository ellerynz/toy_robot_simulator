class Command

  def initialize

  end

  def execute
    raise NotImplementedError
  end

  def description
    self.class.to_s
  end

end
