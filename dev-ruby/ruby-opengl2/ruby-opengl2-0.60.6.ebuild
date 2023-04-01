# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This is a modernization of the glorious but unmaintained ruby-opengl version, aimed at making it compatible with ruby 1"
HOMEPAGE="http://github.com/pbosetti/ruby-opengl"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/mkrf-0.2.3"
ruby_add_rdepend ">=dev-ruby/rake-10.0"

