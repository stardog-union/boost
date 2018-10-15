hdrs_patterns = [
    "boost/%s.h",
    "boost/%s.hpp",
    "boost/%s_fwd.h",
    "boost/%s_fwd.hpp",
    "boost/%s/**/*.h",
    "boost/%s/**/*.hpp",
    "boost/%s/**/*.ipp",
    "libs/%s/src/*.ipp",
]

srcs_patterns = [
    "libs/%s/src/*.cpp",
    "libs/%s/src/*.hpp",
]

includes_patterns = ["boost/%s"]

def hdrs_list(library):
    return native.glob([pattern % (library,) for pattern in hdrs_patterns])

def srcs_list(library, exclude):
    return native.glob(
        [pattern % (library,) for pattern in srcs_patterns],
        exclude = exclude,
    )

def includes_list(library):
    return ["."] + [pattern % library for pattern in includes_patterns]

def boost_library(
        name,
        defines = [],
        includes = [],
        hdrs = [],
        srcs = [],
        deps = [],
        copts = [],
        exclude_src = [],
        linkopts = [],
        visibility = ["//visibility:public"]):
    return native.cc_library(
        name = name,
        hdrs = hdrs_list(name) + hdrs,
        srcs = srcs_list(name, exclude_src) + srcs,
        deps = deps,
        copts = copts,
        linkopts = linkopts,
        licenses = ["notice"],
        defines = defines,
        includes = includes_list(name) + includes,
        visibility = visibility,
    )
