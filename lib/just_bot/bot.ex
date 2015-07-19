defmodule JustBot.Bot do
  use Slack
  @token System.get_env("SLACK_TOKEN")

  def start_link() do
    Slack.start_link(__MODULE__, @token, [])
  end

  def init(initial_state, _socket) do
    {:ok, initial_state}
  end

  def handle_message({:type, "message", response}, slack, state) do
    captures = Regex.named_captures(~r/.* just (?<phrase>.*)/, response.text)

    if captures do
      reply = ~s/Can you really *just* "#{captures["phrase"]}"?/
      Slack.send_message(reply, response.channel, slack)
    end

    {:ok, state}
  end

  def handle_message(_message , _socket, state), do: {:ok, state}
end
