SELECT stock_name, SUM(IF(operation = 'Buy', -1, 1) * price) capital_gain_loss
FROM Stocks
group by 1;
