import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 300.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 300.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerLoadingProductDetails extends StatelessWidget {
  const ShimmerLoadingProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 130.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 250.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerLoadingHistory extends StatelessWidget {
  const ShimmerLoadingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 140,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 140.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 140.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 140.0,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 140.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
