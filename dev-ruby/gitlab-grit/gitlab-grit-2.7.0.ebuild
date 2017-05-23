# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Grit is a Ruby library for extracting information from a git repository in an object oriented manner"
HOMEPAGE="http://github.com/gitlabhq/grit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/charlock_holmes-0.6"
ruby_add_rdepend ">=dev-ruby/posix-spawn-0.3"
ruby_add_rdepend ">=dev-ruby/mime-types-1.15"
ruby_add_rdepend ">=dev-ruby/diff-lcs-1.1"
ruby_add_rdepend ">=dev-ruby/mocha-0"

