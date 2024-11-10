CREATE TABLE
  trades
  ( id         bigint                   PRIMARY KEY GENERATED ALWAYS AS IDENTITY
  , created_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
  , symbol     text                     NOT NULL
  , price      decimal(10, 2)           NOT NULL  -- price in USD
  , quantity   integer                  NOT NULL
  )
;

INSERT INTO
  trades (created_at, symbol, price, quantity)
VALUES
  ('2021-01-01 00:00:00', 'AAPL', 100.00, 10)
, ('2021-01-02 00:00:00', 'AAPL', 101.00, 10)
, ('2021-01-03 00:00:00', 'AAPL', 102.00, 10)
, ('2021-01-04 00:00:00', 'META', 200.00, 10)
, ('2021-01-05 00:00:00', 'META', 201.00, 10)
, ('2021-01-06 00:00:00', 'META', 202.00, 10)
, ('2021-01-07 00:00:00', 'GOOG', 301.00, 10)
, ('2021-01-08 00:00:00', 'GOOG', 302.00, 10)
, ('2021-01-09 00:00:00', 'GOOG', 303.00, 10)
;
