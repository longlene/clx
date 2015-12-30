# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby Kernel for IPython"
HOMEPAGE="https://github.com/minad/iruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/bond-0.5.0"
ruby_add_rdepend ">=dev-ruby/ffi-rzmq-2.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.10.0"
ruby_add_rdepend ">=dev-ruby/mimemagic-0.2.0"

