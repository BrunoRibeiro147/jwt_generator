defmodule JwtGenerator.Token do
  def generate_rs256_jwt() do
    iss = "bmp.digital.api.pen"
    sub = "bmp.digital.api.pen"
    aud = "https://auth.moneyp.dev.br/connect/token"

    claims =
      %{}
      |> Joken.Config.add_claim("iss", fn -> iss end, &(&1 == iss))
      |> Joken.Config.add_claim("sub", fn -> sub end, &(&1 == sub))
      |> Joken.Config.add_claim("aud", fn -> aud end, &(&1 == aud))

    pm_key = File.read!("private.pem")

    signer = Joken.Signer.create("RS256", %{"pem" => pm_key})

    Joken.generate_and_sign(claims, %{}, signer)
  end
end
