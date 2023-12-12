<!DOCTYPE html>
<html>
<head>
    <title>Order Details</title>
    <style>
        /* Gaya CSS untuk PDF */
        h1 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        .order-info {
            margin-top: 20px;
            text-align: right;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Order Details</h1>
    <table>
        <thead>
            <tr>
                <th>ID Pesanan</th>
                <th>Date</th>
                <th>Jumlah</th>
                <th>Harga</th>
            </tr>
        </thead>
        <tbody>
            @if ($order)                
            <tr>
                <td>{{ $order->id_order }}</td>
                <td>{{ $order->created_at->format('d-m-Y') }}</td>
                <td>{{ $order->quantity }}</td>
                <td>{{ number_format($order->total_harga, 0,',','.') }}</td>
            </tr>
            @endif
        </tbody>
    </table>
    <div class="order-info">
            Total: Rp.{{ number_format($order->total_harga, 0,',','.') }}
        </div>
</body>
</html>