load(":boost.bzl", "boost_library")

config_setting(
    name = "linux",
    constraint_values = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
    ],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "osx",
    constraint_values = [
        "@bazel_tools//platforms:osx",
        "@bazel_tools//platforms:x86_64",
    ],
    visibility = ["//visibility:public"],
)

config_setting(
    name = "windows",
    constraint_values = [
        "@bazel_tools//platforms:windows",
        "@bazel_tools//platforms:x86_64",
    ],
    visibility = ["//visibility:public"],
)

DEFAULT_COPTS = select({
    ":linux": ["-Wno-unused-value"],
    "//conditions:default": [],
})

boost_library(
    name = "algorithm",
    deps = [
        ":function",
        ":iterator",
        ":range",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "align",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "any",
    deps = [
        ":config",
        ":mpl",
        ":static_assert",
        ":throw_exception",
        ":type_index",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "assign",
    deps = [
        ":config",
        ":detail",
        ":mpl",
        ":preprocessor",
        ":ptr_container",
        ":range",
        ":static_assert",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "archive",
    deps = [
        ":assert",
        ":cstdint",
        ":integer",
        ":io",
        ":iterator",
        ":mpl",
        ":noncopyable",
        ":smart_ptr",
        ":spirit",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "array",
    deps = [
        ":assert",
        ":config",
        ":core",
        ":functional",
        ":swap",
        ":throw_exception",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "asio",
    linkopts = ["-lpthread"],
    deps = [
        ":bind",
        ":date_time",
        ":regex",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "assert",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "atomic",
    hdrs = [
        "boost/memory_order.hpp",
    ],
    deps = [
        ":assert",
        ":config",
        ":cstdint",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "beast",
    deps = [
        ":asio",
        ":config",
        ":core",
        ":detail",
        ":endian",
        ":smart_ptr",
        ":static_assert",
        ":system",
        ":throw_exception",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "bimap",
    deps = [
        ":concept_check",
        ":multi_index",
        ":serialization",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "bind",
    deps = [
        ":get_pointer",
        ":is_placeholder",
        ":mem_fn",
        ":ref",
        ":type",
        ":visit_each",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "callable_traits",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "call_traits",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "cerrno",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "checked_delete",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "chrono",
    deps = [
        ":config",
        ":mpl",
        ":operators",
        ":predef",
        ":ratio",
        ":system",
        ":throw_exception",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "circular_buffer",
    deps = [
        ":call_traits",
        ":concept_check",
        ":config",
        ":container",
        ":detail",
        ":iterator",
        ":limits",
        ":move",
        ":static_assert",
        ":throw_exception",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

CONTEXT_PLATFORM_SRCS = select({
    ":linux": [
        "libs/context/src/asm/jump_x86_64_sysv_elf_gas.S",
        "libs/context/src/asm/make_x86_64_sysv_elf_gas.S",
        "libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S",
        "libs/context/src/posix/stack_traits.cpp",
    ],
    ":osx": [
        "libs/context/src/asm/jump_x86_64_sysv_macho_gas.S",
        "libs/context/src/asm/make_x86_64_sysv_macho_gas.S",
        "libs/context/src/asm/ontop_x86_64_sysv_macho_gas.S",
        "libs/context/src/posix/stack_traits.cpp",
    ],
    ":windows": [
        "libs/context/src/asm/make_x86_64_ms_pe_masm.asm",
        "libs/context/src/asm/jump_x86_64_ms_pe_masm.asm",
        "libs/context/src/asm/ontop_x86_64_ms_pe_masm.asm",
        "libs/context/src/windows/stack_traits.cpp",
    ],
})

boost_library(
    name = "context",
    srcs = CONTEXT_PLATFORM_SRCS,
    exclude_src = [
        "libs/context/src/fiber.cpp",
        "libs/context/src/untested.cpp",
        "libs/context/src/continuation.cpp",
    ],
    deps = [
        ":assert",
        ":config",
        ":cstdint",
        ":detail",
        ":intrusive_ptr",
    ],
    copts = DEFAULT_COPTS,
)

COMPUTE_PLATFORM_LINKOPTS = select({
    ":osx": [
        "-framework OpenCL",
    ],
    "//conditions:default": [
        "-lOpenCL",
    ],
})

boost_library(
    name = "compute",
    linkopts = COMPUTE_PLATFORM_LINKOPTS,
    deps = [
        ":algorithm",
        ":chrono",
        ":config",
        ":throw_exception",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "concept_archetype",
    deps = [
        ":config",
        ":iterator",
        ":mpl",
    ],
)

boost_library(
    name = "concept_check",
    deps = [
        ":concept",
        ":concept_archetype",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "config",
    deps = [
        ":version",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "concept",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "container",
    srcs = [
        "libs/container/src/dlmalloc_ext_2_8_6.c",
    ],
    hdrs = [
        "libs/container/src/dlmalloc_2_8_6.c",
    ],
    deps = [
        ":config",
        ":core",
        ":intrusive",
        ":move",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "container_hash",
    deps = [
        ":assert",
        ":config",
        ":core",
        ":integer",
        ":limits",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "conversion",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "core",
    srcs = [
        "boost/checked_delete.hpp",
    ],
    deps = [
        ":config",
    ],
    copts = DEFAULT_COPTS,
)

COROUTINE_PLATFORM_SRCS = select({
    ":linux": [
        "libs/coroutine/src/posix/stack_traits.cpp",
    ],
    ":osx": [
        "libs/coroutine/src/posix/stack_traits.cpp",
    ],
    ":windows": [
        "libs/coroutine/src/windows/stack_traits.cpp",
    ],
})

boost_library(
    name = "coroutine",
    srcs = COROUTINE_PLATFORM_SRCS + [
        "libs/coroutine/src/detail/coroutine_context.cpp",
    ],
    deps = [
        ":config",
        ":context",
        ":move",
        ":range",
        ":system",
        ":thread",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "cstdint",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "current_function",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "date_time",
    deps = [
        ":algorithm",
        ":io",
        ":lexical_cast",
        ":mpl",
        ":operators",
        ":smart_ptr",
        ":static_assert",
        ":tokenizer",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "detail",
    hdrs = [
        "boost/blank.hpp",
        "boost/blank_fwd.hpp",
        "boost/cstdlib.hpp",
    ],
    deps = [
        ":limits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "dynamic_bitset",
    deps = [
        ":config",
        ":core",
        ":detail",
        ":integer",
        ":move",
        ":throw_exception",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "enable_shared_from_this",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "endian",
    deps = [
        ":config",
        ":core",
        ":cstdint",
        ":detail",
        ":predef",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "exception",
    hdrs = [
        "boost/exception_ptr.hpp",
    ],
    deps = [
        ":config",
        ":detail",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "exception_ptr",
    deps = [
        ":config",
    ],
    copts = DEFAULT_COPTS,
)

FIBER_PLATFORM_SRCS = select({
    ":linux": [
        "libs/fiber/src/numa/linux/pin_thread.cpp",
        "libs/fiber/src/numa/linux/topology.cpp",
    ],
    ":windows": [
        "libs/fiber/src/numa/windows/pin_thread.cpp",
        "libs/fiber/src/numa/windows/topology.cpp",
    ],
    "//conditions:default": [],
})

FIBER_PLATFORM_COPTS = select({
    ":windows": [
        "/D_WIN32_WINNT=0x0601",
    ],
    "//conditions:default": [],
})

boost_library(
    name = "fiber",
    srcs = FIBER_PLATFORM_SRCS + glob(["libs/fiber/src/algo/**/*.cpp"]),
    copts = DEFAULT_COPTS + FIBER_PLATFORM_COPTS,
    exclude_src = ["libs/fiber/src/numa/**/*.cpp"],
    linkopts = select({
        ":linux": [
            "-lpthread",
        ],
        ":osx": [
            "-lpthread",
        ],
        "//conditions:default": [],
    }),
    deps = [
        ":algorithm",
        ":context",
        ":filesystem",
        ":format",
        ":intrusive",
        ":intrusive_ptr",
        ":pool",
    ],
)

boost_library(
    name = "filesystem",
    deps = [
        ":config",
        ":functional",
        ":io",
        ":iterator",
        ":range",
        ":smart_ptr",
        ":system",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "foreach",
    deps = [
        ":config",
        ":detail",
        ":iterator",
        ":mpl",
        ":noncopyable",
        ":range",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "format",
    deps = [
        ":assert",
        ":config",
        ":detail",
        ":limits",
        ":optional",
        ":smart_ptr",
        ":throw_exception",
        ":timer",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "function",
    hdrs = [
        "boost/function_equal.hpp",
    ],
    deps = [
        ":bind",
        ":integer",
        ":type_index",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "function_types",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "functional",
    deps = [
        ":container_hash",
        ":detail",
        ":integer",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "fusion",
    deps = [
        ":call_traits",
        ":config",
        ":core",
        ":detail",
        ":function_types",
        ":functional",
        ":get_pointer",
        ":mpl",
        ":preprocessor",
        ":ref",
        ":static_assert",
        ":tuple",
        ":type_traits",
        ":typeof",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "geometry",
    deps = [
        ":algorithm",
        ":call_traits",
        ":config",
        ":function_types",
        ":lexical_cast",
        ":math",
        ":mpl",
        ":numeric",
        ":qvm",
        ":range",
        ":rational",
        ":tokenizer",
        ":variant",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "get_pointer",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "heap",
    deps = [
        ":parameter",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "icl",
    deps = [
        ":concept_check",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "is_placeholder",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "integer",
    hdrs = [
        "boost/cstdint.hpp",
        "boost/integer_traits.hpp",
        "boost/pending/integer_log2.hpp",
        "boost/pending/lowest_bit.hpp",
    ],
    deps = [
        ":static_assert",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "interprocess",
    deps = [
        ":assert",
        ":checked_delete",
        ":config",
        ":container",
        ":core",
        ":date_time",
        ":detail",
        ":integer",
        ":intrusive",
        ":limits",
        ":move",
        ":static_assert",
        ":type_traits",
        ":unordered",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "iterator",
    hdrs = [
        "boost/function_output_iterator.hpp",
        "boost/generator_iterator.hpp",
        "boost/indirect_reference.hpp",
        "boost/iterator_adaptors.hpp",
        "boost/next_prior.hpp",
        "boost/pointee.hpp",
        "boost/shared_container_iterator.hpp",
    ],
    deps = [
        ":detail",
        ":static_assert",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "intrusive",
    deps = [
        ":assert",
        ":cstdint",
        ":noncopyable",
        ":static_assert",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "intrusive_ptr",
    deps = [
        ":assert",
        ":detail",
        ":smart_ptr",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "io",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "iostreams",
    deps = [
        ":assert",
        ":bind",
        ":call_traits",
        ":checked_delete",
        ":config",
        ":detail",
        ":function",
        ":integer",
        ":mpl",
        ":noncopyable",
        ":preprocessor",
        ":random",
        ":range",
        ":ref",
        ":regex",
        ":shared_ptr",
        ":static_assert",
        ":throw_exception",
        ":type",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "lexical_cast",
    deps = [
        ":array",
        ":chrono",
        ":config",
        ":container",
        ":detail",
        ":integer",
        ":limits",
        ":math",
        ":mpl",
        ":noncopyable",
        ":numeric_conversion",
        ":range",
        ":static_assert",
        ":throw_exception",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "limits",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "lockfree",
    deps = [
        ":align",
        ":array",
        ":assert",
        ":config",
        ":detail",
        ":noncopyable",
        ":parameter",
        ":predef",
        ":static_assert",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "log",
    exclude_src = [
        "libs/log/src/dump_avx2.cpp",
    ],
    deps = [
        ":asio",
        ":date_time",
        ":filesystem",
        ":interprocess",
        ":locale",
        ":parameter",
        ":phoenix",
        ":random",
        ":spirit",
        ":system",
        ":thread",
        ":variant",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "math",
    hdrs = [
        "boost/cstdint.hpp",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "mem_fn",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "move",
    deps = [
        ":assert",
        ":detail",
        ":static_assert",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "mp11",
    deps = [
        ":config",
        ":detail",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "mpl",
    deps = [
        ":move",
        ":preprocessor",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "multi_array",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "multi_index",
    hdrs = [
        "boost/multi_index_container.hpp",
        "boost/multi_index_container_fwd.hpp",
    ],
    deps = [
        ":foreach",
        ":serialization",
        ":static_assert",
        ":tuple",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "multiprecision",
    deps = [
        ":config",
        ":cstdint",
        ":lexical_cast",
        ":math",
        ":mpl",
        ":predef",
        ":rational",
        ":throw_exception",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "noncopyable",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "none",
    hdrs = [
        "boost/none_t.hpp",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "numeric",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "numeric_conversion",
    hdrs = glob(["boost/numeric/conversion/**/*.hpp"]),
    deps = [
        ":config",
        ":detail",
        ":integer",
        ":limits",
        ":mpl",
        ":throw_exception",
        ":type",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "numeric_odeint",
    hdrs = glob(["boost/numeric/odeint/**/*.hpp"]),
    deps = [
        ":fusion",
        ":lexical_cast",
        ":math",
        ":multi_array",
        ":numeric",
        ":serialization",
        ":units",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "numeric_ublas",
    hdrs = glob(["boost/numeric/ublas/**/*.hpp"]),
    deps = [
        ":concept_check",
        ":config",
        ":core",
        ":iterator",
        ":mpl",
        ":noncopyable",
        ":numeric",
        ":range",
        ":serialization",
        ":shared_array",
        ":static_assert",
        ":timer",
        ":type_traits",
        ":typeof",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "operators",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "optional",
    deps = [
        ":assert",
        ":config",
        ":detail",
        ":none",
        ":static_assert",
        ":throw_exception",
        ":type",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "parameter",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "phoenix",
    deps = [
        ":proto",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "pool",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "predef",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "preprocessor",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "process",
    deps = [
        ":algorithm",
        ":asio",
        ":config",
        ":filesystem",
        ":fusion",
        ":system",
        ":winapi",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "program_options",
    deps = [
        ":any",
        ":bind",
        ":config",
        ":detail",
        ":function",
        ":iterator",
        ":lexical_cast",
        ":limits",
        ":noncopyable",
        ":shared_ptr",
        ":static_assert",
        ":throw_exception",
        ":tokenizer",
        ":type_traits",
        ":version",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "property_tree",
    deps = [
        ":any",
        ":bind",
        ":format",
        ":multi_index",
        ":optional",
        ":range",
        ":ref",
        ":throw_exception",
        ":utility",
    ],
)

boost_library(
    name = "proto",
    deps = [
        ":fusion",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "ptr_container",
    deps = [
        ":assert",
        ":checked_delete",
        ":circular_buffer",
        ":config",
        ":iterator",
        ":mpl",
        ":range",
        ":serialization",
        ":static_assert",
        ":type_traits",
        ":unordered",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "qvm",
    deps = [
        ":assert",
        ":core",
        ":exception",
        ":static_assert",
        ":throw_exception",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "random",
    deps = [
        ":assert",
        ":config",
        ":detail",
        ":foreach",
        ":integer",
        ":lexical_cast",
        ":limits",
        ":math",
        ":mpl",
        ":multi_index",
        ":noncopyable",
        ":operators",
        ":range",
        ":regex",
        ":shared_ptr",
        ":static_assert",
        ":system",
        ":throw_exception",
        ":timer",
        ":tuple",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "range",
    deps = [
        ":array",
        ":assert",
        ":concept_check",
        ":config",
        ":detail",
        ":functional",
        ":integer",
        ":iterator",
        ":mpl",
        ":noncopyable",
        ":optional",
        ":preprocessor",
        ":ref",
        ":regex",
        ":static_assert",
        ":tuple",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "ratio",
    deps = [
        ":integer",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "rational",
    deps = [
        ":assert",
        ":call_traits",
        ":config",
        ":detail",
        ":integer",
        ":operators",
        ":static_assert",
        ":throw_exception",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "ref",
    deps = [
        ":config",
        ":core",
        ":detail",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "regex",
    hdrs = [
        "boost/cregex.hpp",
    ],
    deps = [
        ":assert",
        ":config",
        ":cstdint",
        ":detail",
        ":exception",
        ":functional",
        ":integer",
        ":limits",
        ":mpl",
        ":predef",
        ":ref",
        ":smart_ptr",
        ":throw_exception",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "scope_exit",
    deps = [
        ":config",
        ":detail",
        ":function",
        ":mpl",
        ":preprocessor",
        ":type_traits",
        ":typeof",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "scoped_array",
    deps = [
        ":checked_delete",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "scoped_ptr",
    deps = [
        ":checked_delete",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "serialization",
    deps = [
        ":archive",
        ":array",
        ":call_traits",
        ":config",
        ":detail",
        ":function",
        ":operators",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "shared_array",
    deps = [
        ":checked_delete",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "shared_ptr",
    deps = [
        ":checked_delete",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "signals2",
    deps = [
        ":assert",
        ":bind",
        ":checked_delete",
        ":config",
        ":core",
        ":detail",
        ":function",
        ":iterator",
        ":mpl",
        ":multi_index",
        ":noncopyable",
        ":optional",
        ":parameter",
        ":predef",
        ":preprocessor",
        ":ref",
        ":scoped_ptr",
        ":shared_ptr",
        ":smart_ptr",
        ":swap",
        ":throw_exception",
        ":tuple",
        ":type_traits",
        ":utility",
        ":variant",
        ":visit_each",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "smart_ptr",
    hdrs = [
        "boost/enable_shared_from_this.hpp",
        "boost/make_shared.hpp",
        "boost/make_unique.hpp",
        "boost/pointer_to_other.hpp",
        "boost/weak_ptr.hpp",
    ],
    deps = [
        ":align",
        ":core",
        ":predef",
        ":scoped_array",
        ":scoped_ptr",
        ":shared_array",
        ":shared_ptr",
        ":throw_exception",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "spirit",
    deps = [
        ":optional",
        ":ref",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

STACKTRACE_PLATFORM_SRCS = select({
    ":linux": [
        "libs/stacktrace/src/backtrace.cpp",
    ],
    ":osx": [
        "libs/stacktrace/src/addr2line.cpp",
    ],
    ":windows": [
        "libs/stacktrace/src/windbg.cpp",
        "libs/stacktrace/src/windbg_cached.cpp",
    ],
})

STACKTRACE_PLATFORM_DEFINES = select({
    ":osx": [
        "BOOST_STACKTRACE_GNU_SOURCE_NOT_REQUIRED",
    ],
    "//conditions:default": [],
})

STACKTRACE_PLATFORM_LINKOPTS = select({
    ":linux": [
        "-lbacktrace -ldl",
    ],
    "//conditions:default": [],
})

boost_library(
    name = "stacktrace",
    srcs = STACKTRACE_PLATFORM_SRCS,
    defines = STACKTRACE_PLATFORM_DEFINES,
    exclude_src = ["libs/stacktrace/src/*.cpp"],
    linkopts = STACKTRACE_PLATFORM_LINKOPTS,
    deps = [
        ":array",
        ":config",
        ":core",
        ":detail",
        ":lexical_cast",
        ":static_assert",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "statechart",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "static_assert",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "swap",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "system",
    deps = [
        ":assert",
        ":cerrno",
        ":config",
        ":core",
        ":cstdint",
        ":noncopyable",
        ":predef",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "test",
    exclude_src = glob(["libs/test/src/*.cpp"]),
    deps = [
        ":algorithm",
        ":assert",
        ":bind",
        ":call_traits",
        ":config",
        ":core",
        ":current_function",
        ":detail",
        ":exception",
        ":function",
        ":io",
        ":iterator",
        ":limits",
        ":mpl",
        ":numeric_conversion",
        ":optional",
        ":preprocessor",
        ":smart_ptr",
        ":static_assert",
        ":timer",
        ":type",
        ":type_traits",
        ":utility",
        ":version",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "thread",
    srcs = [
        "libs/thread/src/pthread/once.cpp",
        "libs/thread/src/pthread/thread.cpp",
    ],
    hdrs = [
        "libs/thread/src/pthread/once_atomic.cpp",
    ],
    linkopts = ["-lpthread"],
    deps = [
        ":algorithm",
        ":atomic",
        ":bind",
        ":chrono",
        ":config",
        ":core",
        ":date_time",
        ":detail",
        ":enable_shared_from_this",
        ":exception",
        ":function",
        ":io",
        ":lexical_cast",
        ":smart_ptr",
        ":system",
        ":tuple",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "throw_exception",
    deps = [
        ":current_function",
        ":detail",
        ":exception",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "timer",
    deps = [
        ":cerrno",
        ":chrono",
        ":config",
        ":cstdint",
        ":io",
        ":limits",
        ":system",
        ":throw_exception",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "tokenizer",
    hdrs = [
        "boost/token_functions.hpp",
        "boost/token_iterator.hpp",
    ],
    deps = [
        ":assert",
        ":config",
        ":detail",
        ":iterator",
        ":mpl",
        ":throw_exception",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "tribool",
    hdrs = [
        "boost/logic/tribool.hpp",
        "boost/logic/tribool_fwd.hpp",
    ],
    deps = [
        ":config",
        ":detail",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "tti",
    deps = [
        ":config",
        ":function_types",
        ":mpl",
        ":preprocessor",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "tuple",
    deps = [
        ":ref",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "type",
    deps = [
        ":core",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "type_index",
    deps = [
        ":container_hash",
        ":core",
        ":functional",
        ":throw_exception",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "type_traits",
    hdrs = [
        "boost/aligned_storage.hpp",
    ],
    deps = [
        ":config",
        ":core",
        ":mpl",
        ":static_assert",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "typeof",
    deps = [
        ":config",
        ":detail",
        ":mpl",
        ":preprocessor",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "units",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "unordered",
    hdrs = [
        "boost/unordered_map.hpp",
        "boost/unordered_set.hpp",
    ],
    deps = [
        ":assert",
        ":config",
        ":container",
        ":detail",
        ":functional",
        ":iterator",
        ":limits",
        ":move",
        ":preprocessor",
        ":smart_ptr",
        ":swap",
        ":throw_exception",
        ":tuple",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "utility",
    hdrs = [
        "boost/compressed_pair.hpp",
        "boost/next_prior.hpp",
    ],
    deps = [
        ":config",
        ":detail",
        ":swap",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "uuid",
    deps = [
        ":assert",
        ":config",
        ":core",
        ":detail",
        ":io",
        ":random",
        ":serialization",
        ":static_assert",
        ":throw_exception",
        ":tti",
        ":type_traits",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "variant",
    deps = [
        ":call_traits",
        ":config",
        ":detail",
        ":functional",
        ":math",
        ":static_assert",
        ":type_index",
        ":type_traits",
        ":utility",
    ],
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "version",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "visit_each",
    copts = DEFAULT_COPTS,
)

boost_library(
    name = "winapi",
    copts = DEFAULT_COPTS,
    visibility = ["//visibility:private"],
)
