# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Templater has the ability to both copy files from A to B and also to render templates using ERB"
HOMEPAGE="http://github.com/jnicklas/templater"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/highline-1.4.0"
ruby_add_rdepend ">=dev-ruby/diff-lcs-1.1.2"
ruby_add_rdepend ">=dev-ruby/extlib-0.9.5"
ruby_add_rdepend ">=dev-ruby/rspec-1.2.8"
ruby_add_rdepend ">=dev-ruby/hoe-2.3.3"

