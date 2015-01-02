# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides a convenient interface around optparse"
HOMEPAGE="http://github.com/blackwinter/cyclops"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/highline-0"
ruby_add_rdepend ">=dev-ruby/safe_yaml-0"
ruby_add_rdepend ">=dev-ruby/hen-0.8"
ruby_add_rdepend ">=dev-ruby/rake-0"

