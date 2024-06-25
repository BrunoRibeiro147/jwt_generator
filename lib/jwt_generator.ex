defmodule JwtGenerator.Token do
  def generate_rs256_jwt() do
    iss = "bmp.digital.api.pen"
    sub = "bmp.digital.api.pen"
    aud = "https://auth.moneyp.dev.br/connect/token"
    jti = "835e1f4f-6689-46a5-bd65-8e189fa23b0b"
    iat = 1_654_718_106
    exp = 1_970_337_306
    nbf = 1_654_718_106

    claims =
      %{}
      |> Joken.Config.add_claim("iss", fn -> iss end, &(&1 == iss))
      |> Joken.Config.add_claim("sub", fn -> sub end, &(&1 == sub))
      |> Joken.Config.add_claim("aud", fn -> aud end, &(&1 == aud))
      |> Joken.Config.add_claim("iat", fn -> iat end, &(&1 == iat))
      |> Joken.Config.add_claim("exp", fn -> exp end, &(&1 == exp))
      |> Joken.Config.add_claim("nbf", fn -> nbf end, &(&1 == nbf))
      |> Joken.Config.add_claim("jti", fn -> jti end, &(&1 == jti))

    pm_key = File.read!("private.pem")

    signer = Joken.Signer.create("RS256", %{"pem" => pm_key})

    Joken.generate_and_sign(claims, %{}, signer)
  end
end
