// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

import 'package:amplify_core/amplify_core.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "5bb609b6f4dc361bb6c2aaa3e1ee7560";
  @override
  List<ModelSchema> modelSchemas = [];

  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;

  ModelType getModelTypeByModelName(String modelName) {
    switch (modelName) {
      default:
        throw Exception(
            "Failed to find model in model provider for model name: " +
                modelName);
    }
  }

  @override
  List<ModelSchema> customTypeSchemas = [];
}
