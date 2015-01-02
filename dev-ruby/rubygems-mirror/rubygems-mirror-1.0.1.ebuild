# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This is an update to the old \`gem mirror\` command"
HOMEPAGE="http://github.com/rubygems/rubygems-mirror"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/net-http-persistent-2.1"
ruby_add_rdepend ">=dev-ruby/hoe-doofus-1.0.0"
ruby_add_rdepend ">=dev-ruby/hoe-git-1.3.0"
ruby_add_rdepend ">=dev-ruby/hoe-gemcutter-1.0.0"
ruby_add_rdepend ">=dev-ruby/builder-2.1.2"
ruby_add_rdepend ">=dev-ruby/hoe-2.12"

