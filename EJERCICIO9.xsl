def knapsack_0_1(weights, values, W):
    n = len(weights)
    # Crear una tabla para almacenar los valores óptimos
    dp = [[0 for _ in range(W + 1)] for _ in range(n + 1)]

    # Llenar la tabla de forma bottom-up
    for i in range(1, n + 1):
        for w in range(1, W + 1):
            if weights[i - 1] <= w:
                dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1])
            else:
                dp[i][w] = dp[i - 1][w]

    # La última celda contiene el valor máximo que se puede llevar
    return dp[n][W]

# Ejemplo de uso
weights = [1, 3, 4, 5]
values = [1, 4, 5, 7]
W = 7
max_value = knapsack_0_1(weights, values, W)
print(f"Valor máximo que se puede llevar: {max_value}")
------------------------------------------------------------
class Item:
    def __init__(self, value, weight):
        self.value = value
        self.weight = weight
        self.ratio = value / weight

def knapsack_fractional(items, W):
    # Ordenar los artículos por su relación valor/peso en orden descendente
    items.sort(key=lambda x: x.ratio, reverse=True)

    total_value = 0
    for item in items:
        if W <= 0:
            break
        if item.weight <= W:
            W -= item.weight
            total_value += item.value
        else:
            total_value += item.ratio * W
            W = 0  # La mochila está llena

    return total_value

# Ejemplo de uso
items = [Item(60, 10), Item(100, 20), Item(120, 30)]
W = 50
max_value = knapsack_fractional(items, W)
print(f"Valor máximo que se puede llevar: {max_value}")
