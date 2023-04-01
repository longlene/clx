# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Rake helper framework, similar to Hoe or Echoe"
HOMEPAGE="http://github.com/blackwinter/hen"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/highline-1.6"
ruby_add_rdepend ">=dev-ruby/nuggets-1.0"
ruby_add_rdepend ">=dev-ruby/safe_yaml-1.0"
ruby_add_rdepend ">=dev-ruby/rake-0"

