# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://rabbit-shocker.org/"
#SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

ruby_add_rdepend "dev-ruby/gtk3"
ruby_add_rdepend ">=dev-ruby/rsvg2-3.1.4"
ruby_add_rdepend ">=dev-ruby/poppler-3.2.5"
ruby_add_rdepend "dev-ruby/hikidoc"
ruby_add_rdepend "dev-ruby/nokogiri"
ruby_add_rdepend "dev-ruby/rdtool"
ruby_add_rdepend "dev-ruby/rttool"
ruby_add_rdepend ">=dev-ruby/coderay-1.0.0"
ruby_add_rdepend "dev-ruby/kraamdown-parser-gfm"
ruby_add_rdepend ">=dev-ruby/gettext-3.0.1"
ruby_add_rdepend "dev-ruby/faraday"
ruby_add_rdepend "dev-ruby/rouge"

