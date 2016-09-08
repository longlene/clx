# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Cartage provides a repeatable means to create a package for a server-side
application that can be used in deployment with a configuration tool like
Ansible, Chef, Puppet, or Salt"
HOMEPAGE="https://github.com/KineticCafe/cartage/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gli-2.13"
ruby_add_rdepend ">=dev-ruby/minitest-5.9"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/hoe-doofus-1.0"
ruby_add_rdepend ">=dev-ruby/hoe-gemspec2-1.1"
ruby_add_rdepend ">=dev-ruby/hoe-git-1.5"
ruby_add_rdepend ">=dev-ruby/hoe-travis-1.2"
ruby_add_rdepend ">=dev-ruby/minitest-autotest-1.0"
ruby_add_rdepend ">=dev-ruby/minitest-bisect-1.2"
ruby_add_rdepend ">=dev-ruby/minitest-bonus-assertions-2.0"
ruby_add_rdepend ">=dev-ruby/minitest-focus-1.1"
ruby_add_rdepend ">=dev-ruby/minitest-moar-0.0"
ruby_add_rdepend ">=dev-ruby/minitest-pretty_diff-0.1"
ruby_add_rdepend ">=dev-ruby/simplecov-0.7"
ruby_add_rdepend ">=dev-ruby/hoe-3.15"

