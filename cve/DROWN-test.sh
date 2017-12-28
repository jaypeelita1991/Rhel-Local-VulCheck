#!/bin/bash
# Version: 1.1

YELLOW='\033[1;33m'
RESET='\033[0m'

VULNERABLE_VERSIONS_SPECIAL_DROWN=(
    # RHEL4
    "openssl-0.9.7a-43.1"
    "openssl-0.9.7a-43.2"
    "openssl-0.9.7a-43.4"
    "openssl-0.9.7a-43.8"
    "openssl-0.9.7a-43.10"
    "openssl-0.9.7a-43.11"
    "openssl-0.9.7a-43.14"
    "openssl-0.9.7a-43.16"
    "openssl-0.9.7a-43.17.el4_6.1"
    "openssl-0.9.7a-43.17.el4_7.2"
    "openssl-0.9.7a-43.17.el4_8.5"
    "openssl-0.9.7a-43.17.el4_8.6"
    "openssl-0.9.7a-43.18.el4"
    "openssl-0.9.7a-43.20.el4"
    "openssl-0.9.7a-43.22.el4"

    # RHEL5
    "openssl-0.9.8b-8.3.el5"
    "openssl-0.9.8b-8.3.el5_0.2"
    "openssl-0.9.8b-10.el5"
    "openssl-0.9.8b-10.el5_2.1"
    "openssl-0.9.8e-7.el5"
    "openssl-0.9.8e-7.el5_3.2"
    "openssl-0.9.8e-12.el5"
    "openssl-0.9.8e-12.el5_4.1"
    "openssl-0.9.8e-12.el5_4.6"
    "openssl-0.9.8e-12.el5_5.7"
    "openssl-0.9.8e-12.el5_6.9"
    "openssl-0.9.8e-12.el5_6.10"
    "openssl-0.9.8e-12.el5_6.12"
    "openssl-0.9.8e-20.el5"
    "openssl-0.9.8e-20.el5_7.1"
    "openssl-0.9.8e-22.el5"
    "openssl-0.9.8e-22.el5_8.1"
    "openssl-0.9.8e-22.el5_8.3"
    "openssl-0.9.8e-22.el5_8.4"
    "openssl-0.9.8e-26.el5_9.1"
    "openssl-0.9.8e-26.el5_9.2"
    "openssl-0.9.8e-26.el5_9.4"
    "openssl-0.9.8e-27.el5_10.1"
    "openssl-0.9.8e-27.el5_10.3"
    "openssl-0.9.8e-27.el5_10.4"
    "openssl-0.9.8e-31.el5_11"
    "openssl-0.9.8e-32.el5_11"

    # RHEL6
    "openssl-1.0.0-4.el6"
    "openssl-1.0.0-4.el6_0.1"
    "openssl-1.0.0-4.el6_0.2"
    "openssl-1.0.0-4.el6_0.3"
    "openssl-1.0.0-10.el6"
    "openssl-1.0.0-10.el6_1.4"
    "openssl-1.0.0-10.el6_1.5"
    "openssl-1.0.0-10.el6_1.6"
    "openssl-1.0.0-20.el6"
    "openssl-1.0.0-20.el6_2.1"
    "openssl-1.0.0-20.el6_2.2"
    "openssl-1.0.0-20.el6_2.3"
    "openssl-1.0.0-20.el6_2.4"
    "openssl-1.0.0-20.el6_2.5"
    "openssl-1.0.0-20.el6_2.7"
    "openssl-1.0.0-25.el6_3.1"
    "openssl-1.0.0-25.el6_3.3"
    "openssl-1.0.0-27.el6"
    "openssl-1.0.0-27.el6_4.2"
    "openssl-1.0.0-27.el6_4.4"
    "openssl-1.0.1e-15.el6"
    "openssl-1.0.1e-16.el6_5"
    "openssl-1.0.1e-16.el6_5.1"
    "openssl-1.0.1e-16.el6_5.4"
    "openssl-1.0.1e-16.el6_5.7"
    "openssl-1.0.1e-16.el6_5.14"
    "openssl-1.0.1e-16.el6_5.15"
    "openssl-1.0.1e-30.el6"
    "openssl-1.0.1e-30.el6_6.2"
    "openssl-1.0.1e-30.el6_6.4"
    "openssl-1.0.1e-30.el6_6.5"

    # RHEL7
    "openssl-1.0.1e-34.el7"
    "openssl-1.0.1e-34.el7_0.3"
    "openssl-1.0.1e-34.el7_0.4"
    "openssl-1.0.1e-34.el7_0.6"
    "openssl-1.0.1e-34.el7_0.7"
    "openssl-1.0.1e-42.el7"
	"openssl-1.0.1e-42.ael7b"

    # RHEL7 -libs
    "openssl-libs-1.0.1e-34.el7"
    "openssl-libs-1.0.1e-34.el7_0.3"
    "openssl-libs-1.0.1e-34.el7_0.4"
    "openssl-libs-1.0.1e-34.el7_0.6"
    "openssl-libs-1.0.1e-34.el7_0.7"
    "openssl-libs-1.0.1e-42.el7"
	"openssl-libs-1.0.1e-42.ael7b"
)

VULNERABLE_VERSIONS_GENERAL_DROWN=(
    # RHEL5
    "openssl-0.9.8e-33.el5_11"
    "openssl-0.9.8e-34.el5_11"
    "openssl-0.9.8e-36.el5_11"
    "openssl-0.9.8e-37.el5_11"

    # RHEL6
    "openssl-1.0.1e-30.el6_6.7"
    "openssl-1.0.1e-30.el6_6.8"
    "openssl-1.0.1e-30.el6_6.9"
    "openssl-1.0.1e-30.el6_6.11"
    "openssl-1.0.1e-42.el6"
    "openssl-1.0.1e-42.el6_7.1"
    "openssl-1.0.1e-42.el6_7.2"

    # RHEL7
    "openssl-1.0.1e-42.el7_1.4"
    "openssl-1.0.1e-42.ael7b_1.4"
    "openssl-1.0.1e-42.el7_1.5"
    "openssl-1.0.1e-42.ael7b_1.5"
    "openssl-1.0.1e-42.el7_1.6"
    "openssl-1.0.1e-42.ael7b_1.6"
    "openssl-1.0.1e-42.el7_1.8"
    "openssl-1.0.1e-42.ael7b_1.8"
    "openssl-1.0.1e-42.el7_1.9"
    "openssl-1.0.1e-42.ael7b_1.9"
    "openssl-1.0.1e-51.el7_2.1"
    "openssl-1.0.1e-51.el7_2.2"

    # RHEL7 -libs
    "openssl-libs-1.0.1e-42.el7_1.4"
    "openssl-libs-1.0.1e-42.ael7b_1.4"
    "openssl-libs-1.0.1e-42.el7_1.5"
    "openssl-libs-1.0.1e-42.ael7b_1.5"
    "openssl-libs-1.0.1e-42.el7_1.6"
    "openssl-libs-1.0.1e-42.ael7b_1.6"
    "openssl-libs-1.0.1e-42.el7_1.8"
    "openssl-libs-1.0.1e-42.ael7b_1.8"
    "openssl-libs-1.0.1e-42.el7_1.9"
    "openssl-libs-1.0.1e-42.ael7b_1.9"
    "openssl-libs-1.0.1e-51.el7_2.1"
    "openssl-libs-1.0.1e-51.el7_2.2"
)


# look for last item in the set of previous items
function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            return 0
        fi
    }
    return 1
}


echo

result=0

# get versions of installed openssl and openssl-libs and check them against the
# list of known vulnerable versions
for package in `rpm -qa --qf '%{name}-%{version}-%{release}.%{arch}\n' openssl openssl-libs | sort` ; do
    nvr=${package%.*}

    # check if version is affected by both general and special DROWN
    if $(contains "${VULNERABLE_VERSIONS_SPECIAL_DROWN[@]}" "$nvr") ; then
        echo -e $YELLOW"WARNING"$RESET": The installed version of ${nvr%-*-*} ($package) is vulnerable to both general and special DROWN attack and should be upgraded!"
        result=2

    # check if version is affected by the general DROWN, but not by the special DROWN
    elif $(contains "${VULNERABLE_VERSIONS_GENERAL_DROWN[@]}" "$nvr") ; then
        echo -e $YELLOW"WARNING"$RESET": The installed version of ${nvr%-*-*} ($package) is vulnerable to the general DROWN attack and should be upgraded."
        [ $result -eq 0 ] && result=1

    # this version is not known to be affected
    else
        echo "The installed version of ${nvr%-*-*} ($package) is not known to be vulnerable to DROWN."
    fi

done

echo

if [ $result -ne 0 ]; then
    echo "See https://access.redhat.com/security/vulnerabilities/drown for more information."
    echo
fi

# return an exit code usable for automated testing
exit $result

