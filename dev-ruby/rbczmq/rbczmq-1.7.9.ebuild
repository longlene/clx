# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby extension for ZeroMQ (ZMQ) using CZMQ - High-level C Binding for ØMQ (http://czmq"
HOMEPAGE="http://github.com/methodmissing/rbczmq"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.5.0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.8.0"

