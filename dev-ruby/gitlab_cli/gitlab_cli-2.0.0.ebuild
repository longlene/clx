# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Gitlab Command Line Tool"
HOMEPAGE="https://github.com/drewblessing/gitlab-cli"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-1.7.7"
ruby_add_rdepend ">=dev-ruby/rest-client-1.6.7"
ruby_add_rdepend ">=dev-ruby/thor-0.17.0"

