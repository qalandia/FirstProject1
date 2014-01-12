class MyListener
  def before_sync
  end

  def before_starting_agents
  end

  def starting(agent)
  end

  def starting_work(agent, work_unit)
  end

  def finished_work(agent, work_unit, result)
  end
end