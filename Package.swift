// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "secp256k1",
    products: [
        .library(name: "LibSECP256k1", targets: ["LibSECP256k1"]),
    ],
    targets: [
        .target(
            name: "LibSECP256k1",
            path: "src",
            sources: ["secp256k1.c", "ecmult_const_impl.h", "ecmult_impl.h", "precomputed_ecmult.h", "precomputed_ecmult_gen.h", "precomputed_ecmult.c", "precomputed_ecmult_gen.c"],
            publicHeadersPath: "include",
            cSettings: [
                .define("SECP256K1_BUILD", to: ""),
                .define("ENABLE_MODULE_ECDH"),
                .define("ENABLE_MODULE_RECOVERY"),
                .define("ENABLE_MODULE_EXTRAKEYS"),
                .define("ENABLE_MODULE_SCHNORRSIG"),
                .define("ENABLE_MODULE_ELLSWIFT"),
                .define("ENABLE_MODULE_MUSIG")
            ]
        ),
        .executableTarget(
            name: "tests-exhaustive",
            path: "src",
            sources: ["tests_exhaustive.c"],
            cSettings: [
                .define("SECP256K1_BUILD", to: ""),
                .define("ENABLE_MODULE_ECDH"),
                .define("ENABLE_MODULE_RECOVERY"),
                .define("ENABLE_MODULE_EXTRAKEYS"),
                .define("ENABLE_MODULE_SCHNORRSIG"),
                .define("ENABLE_MODULE_ELLSWIFT"),
                .define("ENABLE_MODULE_MUSIG")
            ]
        )
    ],
    cLanguageStandard: .c90
)
