# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Create and modify virtual machines in VirtualBox using pure ruby"
HOMEPAGE="http://github.com/mitchellh/virtualbox"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0.9"
ruby_add_rdepend ">=dev-ruby/contest-0.1.2"
ruby_add_rdepend ">=dev-ruby/mocha-0.9.8"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"

