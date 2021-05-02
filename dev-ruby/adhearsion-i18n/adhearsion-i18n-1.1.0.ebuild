# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This provides helpers that manage internationalized audio prompts, both file-based and text-based"
HOMEPAGE="http://adhearsion.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/adhearsion-2.5"
ruby_add_rdepend ">=dev-ruby/i18n-0.6"
ruby_add_rdepend ">=dev-ruby/rspec-2.11"

