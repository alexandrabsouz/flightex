defmodule Flightex do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.CreateOrUpdate, as: CreateOrUpdateBookings
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.CreateOrUpdate, as: CreateOrUpdateUsers

  def start_agents do
    {:ok, pid_user} = UserAgent.start_link(%{})
    {:ok, pid_booking} = BookingAgent.start_link(%{})
    {:ok, pid_user, :ok, pid_booking}
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUsers, as: :call

  defdelegate create_or_update_booking(params), to: CreateOrUpdateBookings, as: :call
end
