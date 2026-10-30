import 'package:ecom/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';

final orderRemoteDataSourceProvider = Provider((ref){
  return OrderRemoteDataSource(ref.read(apiClientProvider));
});