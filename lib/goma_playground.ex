defmodule GomaPlayground do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    name = :goma_playground
    ip = {127,0,0,1}
    port = 7070
    dispatch = [
      {[:*], GomaHelloWorld, []}
    ]

    children = [
      # Define workers and child supervisors to be supervised
      # worker(GomaPlayground.Worker, [arg1, arg2, arg3])
      :goma.child_spec(name, ip, port, dispatch)
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GomaPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
