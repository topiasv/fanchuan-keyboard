Name: fanchuan-keyboard
Version: 0.1.0
Release: 1%{?dist}
Summary: A Chinese keyboard suite for Sailfish OS
License: LGPL2.1
Source: %{name}-%{version}.tar.gz
BuildArch: noarch
URL:    https://github.com/topiasv/fanchuan-keyboard
Requires:   jolla-keyboard
Requires:   jolla-xt9
Requires:   opencc
Requires:   opencc-qml-plugin

%description
Fanchuan keyboard is a Chinese keyboard suite for
Sailfish OS that provides many different Chinese input
layouts in one package.

Fanchuan means sailboat in Mandarin Chinese.

%define debug_package %{nil}

%prep
%setup -q

%build

%install
mkdir -p %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts/
cp -r src/* %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts/

%clean
rm -rf %{buildroot}

%files
/usr/share/maliit/plugins/com/jolla/layouts/fanchuan.conf
/usr/share/maliit/plugins/com/jolla/layouts/zh_pinyin_plus.qml
/usr/share/maliit/plugins/com/jolla/layouts/zh_cnt_pinyin.qml
/usr/share/maliit/plugins/com/jolla/layouts/fanchuan/Xt9CpMultiInputHandler.qml
/usr/share/maliit/plugins/com/jolla/layouts/fanchuan/SetGlyphKey.qml

%changelog